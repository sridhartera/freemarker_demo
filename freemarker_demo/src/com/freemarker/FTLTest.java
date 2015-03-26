package com.freemarker;

import java.io.IOException;
import java.io.OutputStreamWriter;
import java.io.Writer;

import freemarker.template.Configuration;
import freemarker.template.Template;
import freemarker.template.TemplateException;

public class FTLTest {
    public static void main(String[] args) {
        
        //Freemarker configuration object
        Configuration cfg = new Configuration();
        try {
            //Load template from source folder
            Template template = cfg.getTemplate("src/test.ftl");
             
            // Console output
            Writer out = new OutputStreamWriter(System.out);
            template.process(out,out);
            out.flush();
        } catch (IOException e) {
            e.printStackTrace();
        } catch (TemplateException e) {
            e.printStackTrace();
        }
    }
}
