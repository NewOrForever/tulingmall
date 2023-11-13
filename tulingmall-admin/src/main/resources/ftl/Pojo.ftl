package com.tuling.tulingmall.model;

import java.io.Serializable;
import java.util.Date;
import java.sql.Timestamp;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.baomidou.mybatisplus.annotation.TableField;

/**
* @desc：the module of table ${table_name}
<#if table_remark !="">found table comment  ${table_remark}</#if>
* @date ${gen_time}
*/
@TableName("${table_name_small}")
public class ${pojo_name} implements Serializable{
    private static final long serialVersionUID = 1L;
<#if COLUMNS?exists>
    <#list COLUMNS as model>
        <#if model.remarks != "">//${model.remarks}</#if><#if model.isPK == "true">
        @TableId</#if>
        @TableField("${model.columnName}")
        private ${model.javaType} ${model.javaName};

    </#list>
</#if>

<#if COLUMNS?exists>
    <#list COLUMNS as model>
        public ${model.javaType} ${model.getterName}() {
            return ${model.javaName};
        }

        public void ${model.setterName}(${model.javaType} ${model.javaName}) {
        <#if model.javaType == "String">
            this.${model.javaName} = ${model.javaName} == null ? null : ${model.javaName}.trim();
        <#else>
            this.${model.javaName} = ${model.javaName};
        </#if>
        }
    </#list>
</#if>

    public String toString(){
        StringBuilder sb = new StringBuilder();
        sb.append("pojo.${pojo_name} ").append("[");
        <#if COLUMNS?exists>
            <#list COLUMNS as model>
                sb.append(", ${model.javaName} = ").append(${model.javaName});
            </#list>
        </#if>
        sb.append("]");
        return sb.toString();
    }
}