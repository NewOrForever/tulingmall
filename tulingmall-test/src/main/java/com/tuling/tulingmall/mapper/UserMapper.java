package com.tuling.tulingmall.mapper;


import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.tuling.tulingmall.domain.User;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

/**
 * @author Fox
 */
@Repository
public interface UserMapper extends BaseMapper<User> {

    @Select("select * from tb_user where username=#{username}")
    User getByUsername(String username);

    @Select("update tb_user set version=version+1,email='xxxx@q.com' where id=#{id} and version=#{version}")
    int updateWithVersionById(@Param("uid") Long uid, @Param("version") Integer version);

    @Select("select * from tb_user where id=#{uid}")
    User selectById(Long uid);

    /**
     * 乐观锁更新 - 并发进来的线程，只有一个线程能够更新成功
     * @param uid
     * @param version
     * @return
     */
    @Select("update tb_user set version=version+1,count=count+1 where id=#{id} and version=#{version}")
    int updateCountWithVersionById(@Param("id") Long uid, @Param("version") Integer version);

    /**
     * 并发进来都能更新成功
     * 如果不使用 @Update 注解的话就不会返回影响行数
     * @Select 注解也不会返回影响行数，@Delete 注解会返回影响行数
     * @param uid
     * @return
     */
    @Update("update tb_user set count=count+1 where id=#{id}")
    int updateCountById(Long uid);
}
