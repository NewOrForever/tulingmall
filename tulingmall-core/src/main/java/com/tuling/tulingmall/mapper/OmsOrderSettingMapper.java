package com.tuling.tulingmall.mapper;

import com.baomidou.dynamic.datasource.annotation.DS;
import com.tuling.tulingmall.model.OmsOrderSetting;
import com.tuling.tulingmall.model.OmsOrderSettingExample;
import org.apache.ibatis.annotations.Param;

import java.util.List;
@DS("order")
public interface OmsOrderSettingMapper {
    long countByExample(OmsOrderSettingExample example);

    int deleteByExample(OmsOrderSettingExample example);

    int deleteByPrimaryKey(Long id);

    int insert(OmsOrderSetting record);

    int insertSelective(OmsOrderSetting record);

    List<OmsOrderSetting> selectByExample(OmsOrderSettingExample example);

    OmsOrderSetting selectByPrimaryKey(Long id);

    int updateByExampleSelective(@Param("record") OmsOrderSetting record, @Param("example") OmsOrderSettingExample example);

    int updateByExample(@Param("record") OmsOrderSetting record, @Param("example") OmsOrderSettingExample example);

    int updateByPrimaryKeySelective(OmsOrderSetting record);

    int updateByPrimaryKey(OmsOrderSetting record);
}