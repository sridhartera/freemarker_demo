package com.freemarker;

import freemarker.template.Template;
import freemarker.template.Configuration;
import java.io.OutputStreamWriter;
import java.io.File;
import java.util.HashMap;
import java.util.Map;

public class Example3
{
	public static void main(String[] args)
	{		
		Map<String, Object> tree = new HashMap<String, Object>();
		File document = new File("src/data-model/example3.xml");

		// Read the XML file and process the template using FreeMarker
		try {
			tree.put("doc", freemarker.ext.dom.NodeModel.parse(document));
			freemarkerDo(tree, "src/ftl-templates/example3.ftl");
		}
		catch(Exception e) {
			System.out.println(e.getLocalizedMessage());
		}
	}

	// Process a template using FreeMarker and print the results
	static void freemarkerDo(Map<String, Object> datamodel, String template) throws Exception
	{
		Configuration cfg = new Configuration();
		Template tpl = cfg.getTemplate(template);
		OutputStreamWriter output = new OutputStreamWriter(System.out);

		tpl.process(datamodel, output);
	}
}