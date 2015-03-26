package com.freemarker;

import freemarker.template.Template;
import freemarker.template.Configuration;

import java.io.IOException;
import java.io.OutputStreamWriter;
import java.io.File;
import java.util.Map;

import org.codehaus.jackson.map.ObjectMapper;


public class Example4Json
{
	public static void main(String[] args)
	{		
		//Map<String, Object> tree = new HashMap<String, Object>();
		File document = new File("src/data-model/example4.json");
		ObjectMapper mapper = new ObjectMapper();
		try {
			@SuppressWarnings("unchecked")
			Map<String, Object> map = mapper.readValue(document, Map.class);
			// display to console
			//System.out.println(map);
			try {
				freemarkerDo(map, "src/ftl-templates/example4_json2xml.ftl");
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}				 
		} catch (IOException e) {	 
			e.printStackTrace();	 
		}
	}
		// Process a template using FreeMarker and print the results
		static void freemarkerDo(Map<String, Object> datamodel, String template) throws Exception
		{
			Configuration cfg = new Configuration();
			Template tpl = cfg.getTemplate(template);
			//System.out.println(datamodel);
			OutputStreamWriter output = new OutputStreamWriter(System.out);

			tpl.process(datamodel, output);
		}		
	

}