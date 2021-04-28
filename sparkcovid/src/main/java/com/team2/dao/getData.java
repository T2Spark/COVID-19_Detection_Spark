package com.team2.dao;

import org.apache.log4j.Level;
import org.apache.log4j.Logger;
import org.apache.spark.SparkConf;
import org.apache.spark.api.java.JavaSparkContext;
import org.apache.spark.sql.Dataset;
import org.apache.spark.sql.Row;
import org.apache.spark.sql.SparkSession;
import org.apache.spark.sql.types.DataTypes;

import static org.apache.spark.sql.functions.*;

import java.util.Arrays;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

public class getData {
	
	public static Map<String,Double> getData() {
		
		Logger.getLogger("org.apache").setLevel(Level.WARN);
		SparkSession spark = SparkSession.builder().appName("testingSql").master("local[*]")
				.config("spark.sql.warehouse.dir", "file:///d:/tmp/")
				.getOrCreate();
		
		Dataset<Row> dataset = spark.read().option("header", true).csv("C:\\Users\\User\\Desktop\\test\\COVID-19_Detection_Spark\\sparkcovid\\src\\main\\resources\\state_wise_pop.csv");
		
		dataset.createOrReplaceTempView("table1");
		dataset = spark.sql("select State_code, Confirmed, Recovered, Deaths, Active, Population from table1");				//change states to state code
		
		spark.udf().register("checkProb",(String active, String pop)->{
			
		return ((double)Integer.parseInt(active)/Integer.parseInt(pop));
			}, DataTypes.DoubleType );
		
		dataset = dataset.withColumn("Probability", callUDF("checkProb", col("Confirmed"), col("Population")));
		

		Map<String, Double> probability= new HashMap<>();
		dataset = dataset.drop("Recovered", "Deaths", "Active", "Confirmed", "Population");
		
		
List<Row> list = dataset.collectAsList();
		
		
		Iterator<Row> currRow = list.iterator();

		
		while(currRow.hasNext()) {
			Row cur =currRow.next();
			String k=(String) cur.get(0);
			Double v=(Double) cur.get(1);
			
			probability.put(k, v);
			
		}
				
		
		return probability;
			
	}
	
}