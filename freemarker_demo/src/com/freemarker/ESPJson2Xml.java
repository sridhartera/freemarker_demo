package com.freemarker;

import freemarker.template.Template;
import freemarker.template.Configuration;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.io.File;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;

import org.codehaus.jackson.map.ObjectMapper;


public class ESPJson2Xml
{
	// Process a template using FreeMarker and print the results
	static void freemarkerDo(Map<String, Object> datamodel, String template) throws Exception
	{
		Configuration cfg = new Configuration();
		Template tpl = cfg.getTemplate(template);
		//System.out.println(datamodel);
		OutputStreamWriter output = new OutputStreamWriter(System.out);

		tpl.process(datamodel, output);
	}		
	
	public static void main(String[] args)
	{		
		//Map<String, Object> tree = new HashMap<String, Object>();
		File document = new File("src/data-model/esp.json");		
		try {
			ObjectMapper mapper = new ObjectMapper();
			@SuppressWarnings("unchecked")
			Map<String, Object> jsonMap = mapper.readValue(document, Map.class);			

			Properties properties = new Properties();
			FileInputStream in = new FileInputStream("src/data-model/esp.properties");
			properties.load(in);
			in.close();
			Map<String, String> propMap = new HashMap<String, String>((Map) properties);
			
			Map<String, Object> iveMap = new HashMap<String, Object>();
			iveMap.put("ive_feature", jsonMap);
			iveMap.put("lookup_prop", propMap);						
			// display to console
			//System.out.println(iveMap);
			
			try {
				freemarkerDo(iveMap, "src/ftl-templates/esp_json2xml.ftl");
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}				 
		} catch (IOException e) {	 
			e.printStackTrace();	 
		}
	}

}
