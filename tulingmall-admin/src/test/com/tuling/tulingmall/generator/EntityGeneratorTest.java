package com.tuling.tulingmall.generator;

import freemarker.template.Configuration;
import freemarker.template.Template;
import org.apache.commons.lang.StringUtils;

import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStreamWriter;
import java.io.Writer;
import java.sql.Connection;
import java.sql.DatabaseMetaData;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.*;

/**
 * @author loulan
 * @desc
 */
public class EntityGeneratorTest {

    private static final String JDBCURL = "jdbc:mysql://192.168.65.71:3306/tl_mall_user?characterEncoding=utf-8&autoReconnect=true&serverTimezone=GMT%2B8";
    private static final String SCHEMA = "tl_mall_user";
    private static final String USERNAME = "tlmall";
    private static final String PASSWORD = "tlmall123";
    private static final String TABLENAME = "ums_member";

    private static List<String> primaryKeys;

    private static final String ftlLocation = System.getProperty("user.dir") + "/tulingmall-admin/src/main/resources/ftl";
    private static final String outputLocation = System.getProperty("user.dir") + "/tulingmall-admin/src/main/resources/ftlout";

    private static final Map<String,String> jdbcToJavaType= new HashMap<>();
    static{
        //初始化jdbc类型转换。
        jdbcToJavaType.put("VARCHAR", "String");
        jdbcToJavaType.put("CHAR", "String");
        jdbcToJavaType.put("VARCHAR2", "String");
        jdbcToJavaType.put("NVARCHAR", "String");
        jdbcToJavaType.put("LONGNVARCHAR", "String");
        jdbcToJavaType.put("TEXT", "String");
        jdbcToJavaType.put("CLOB", "String");
        jdbcToJavaType.put("TINYLOB", "String");
        jdbcToJavaType.put("INT", "Integer");
        jdbcToJavaType.put("INTEGER", "Integer");
        jdbcToJavaType.put("SMALLINT", "Integer");
        jdbcToJavaType.put("TINYINT", "Integer");
        jdbcToJavaType.put("BIGINT", "Long");

        jdbcToJavaType.put("NUMBERIC", "Long");
        jdbcToJavaType.put("NUMBER", "Long");
        jdbcToJavaType.put("DOUBLE", "Double");
        jdbcToJavaType.put("FLOAT", "Float");

        jdbcToJavaType.put("DATE", "Date");
        jdbcToJavaType.put("DATETIME", "Date");//java.util.Date
        jdbcToJavaType.put("TIMESTAMP", "Timestamp");//java.sql.Timestamp

    }

    public static void main(String[] args) throws Exception {
        Configuration conf = new Configuration(Configuration.getVersion());
        conf.setDirectoryForTemplateLoading(new File(ftlLocation));

        System.out.println("==== 开始生成 " + TABLENAME + " 表对应的POJO ====");
        Template template = conf.getTemplate("Pojo.ftl");

        // 拼凑参数
        Map<String, Object> paramMap = getCommonParam(TABLENAME);
        String pojoName = paramMap.get("pojo_name").toString();

        addTableInfo(paramMap, TABLENAME);

        // 生成文件
        String pojoLocation = outputLocation + "/" + pojoName + ".java";
        File pojoFile = new File(pojoLocation);
        Writer writer = new OutputStreamWriter(new FileOutputStream(pojoFile), "UTF-8");
        template.process(paramMap, writer);
        writer.flush();
        writer.close();
        System.out.println("==== " + TABLENAME + " 表对应的POJO类生成成功 生成地址：" + pojoLocation + " ====");

    }

    private static void addTableInfo(Map<String, Object> paramMap, String tableName) throws Exception {
        //获取表结构信息 主要是表名、表注释、字段名，字段类型， 字段注释。
        Class.forName("com.mysql.cj.jdbc.Driver");
        Properties dbProps = new Properties();
        dbProps.put("user", USERNAME);
        dbProps.put("password",PASSWORD);
        dbProps.put("useInformationSchema", "true");
        Connection con = DriverManager.getConnection(JDBCURL,dbProps);
        DatabaseMetaData meta = con.getMetaData();
        //获取表信息
        ResultSet tableSet = meta.getTables(SCHEMA, "%", tableName, new String[]{"TABLE"});
        if (tableSet.next()) {//只取查到的第一条数据
            paramMap.put("table_name", tableName);
            paramMap.put("table_name_small", tableName.toLowerCase());
            paramMap.put("table_remark", tableSet.getString("REMARKS"));
            System.out.println("获取到表信息 TABLE_NAME => " + tableSet.getString("TABLE_NAME") + ";TABLE_REMARK => " + tableSet.getString("REMARKS"));
        } else {
            System.err.println("数据库中没有查到表 " + tableName);
            throw new Exception("数据库中没有查到表 " + tableName);
        }
        //加载主键。
        if (null == primaryKeys || primaryKeys.size() == 0) {
            primaryKeys = new ArrayList<String>();//主键列名
            ResultSet primaryKeySet = meta.getPrimaryKeys(SCHEMA, "%", tableName);
            while (primaryKeySet.next()) {
                primaryKeys.add(primaryKeySet.getString("COLUMN_NAME"));
            }
        }
        //获取字段信息
        ResultSet columnSet = meta.getColumns(SCHEMA, "%", tableName, "%");
        List<Map<String, Object>> columns = new ArrayList<>();
        while (columnSet.next()) {
            Map<String, Object> columnInfo = new HashMap<>();
            String columnName = columnSet.getString("COLUMN_NAME");
            String columnType = columnSet.getString("TYPE_NAME");
            int datasize = columnSet.getInt("COLUMN_SIZE");
            int digits = columnSet.getInt("DECIMAL_DIGITS");
            int nullable = columnSet.getInt("NULLABLE");
            String remarks = columnSet.getString("REMARKS");
            System.out.println("获取到字段信息 ： columnName =>" + columnName + ";columnType => " + columnType + ";datasize=>" + datasize + "=>" + digits + ";nullable => " + nullable + ";remarks => " + remarks);
            //只对JDBC几种常见的数据类型做下匹配，其他不常用的就暂时不生成了。 健壮的类型映射还是需要看下别的框架是怎么做的。
            if (StringUtils.isNotBlank(columnType)
                    && jdbcToJavaType.containsKey(columnType.toUpperCase())) {
                columnInfo.put("columnName", columnName);
                columnInfo.put("columnType", columnType);
                columnInfo.put("javaType", jdbcToJavaType.get(columnType.toUpperCase()));
                String javaName = getCamelName(columnName);
                columnInfo.put("javaName", javaName);
                columnInfo.put("getterName", "get" + javaName.substring(0, 1).toUpperCase() + javaName.substring(1));
                columnInfo.put("setterName", "set" + javaName.substring(0, 1).toUpperCase() + javaName.substring(1));
                columnInfo.put("remarks", StringUtils.isNotBlank(remarks) ? remarks : "");
                columnInfo.put("isPK", primaryKeys.contains(columnName) ? "true" : "");
                columns.add(columnInfo);
            } else {
                System.out.println("字段信息 ： columnName =>" + columnName + " 类型 columnType => " + columnType + " 暂无法处理，待以后进行扩展 ;");
                throw new Exception("字段信息 ： columnName =>" + columnName + " 类型 columnType => " + columnType + " 暂无法处理，待以后进行扩展 ;");
            }

        }
        paramMap.put("COLUMNS", columns);
        //获取表主键信息
        //ResultSet primaryKeys = meta.getPrimaryKeys(null, schema, tableName);

    }

    private static String getCamelName(String columnName) {
        //防止死循环，加个计数器。
        int count = 5;
        while(columnName.indexOf("_")>-1 && count >0) {
            int index = columnName.indexOf("_");
            columnName = columnName.substring(0,1).toLowerCase()+columnName.substring(1, index)
                    +columnName.substring(index+1,index+2).toUpperCase()+columnName.substring(index+2);
            count --;
        }
        return columnName;
    }

    private static Map<String, Object> getCommonParam(String tableName) {
        Map<String, Object> paramMap = new HashMap<>();
        String pojoName = getPOJONameByTableName(tableName);
        paramMap.put("pojo_name", pojoName);
//        String moduleName = PropLoader.getPlanProp("plan.moduleName");
//        paramMap.put("module_name", moduleName);
        String genTime = LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy/MM/dd"));
        paramMap.put("gen_time", genTime);
        return paramMap;
    }

    private static String getPOJONameByTableName(String tableName) {
        //防止死循环，加个计数器。
        tableName = tableName.substring(0, 1).toUpperCase() + tableName.substring(1);
        int count = 5;
        while (tableName.indexOf("_") > -1 && count > 0) {
            int index = tableName.indexOf("_");
            tableName = tableName.substring(0, index)
                    + tableName.substring(index + 1, index + 2).toUpperCase() + tableName.substring(index + 2);
            count--;
        }
        return tableName;
    }

}
