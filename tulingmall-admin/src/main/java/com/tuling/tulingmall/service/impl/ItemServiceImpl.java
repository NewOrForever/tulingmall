package com.tuling.tulingmall.service.impl;

import com.tuling.tulingmall.mapper.PmsProductMapper;
import com.tuling.tulingmall.model.PmsProduct;
import com.tuling.tulingmall.service.ItemService;
import freemarker.template.Configuration;
import freemarker.template.Template;
import freemarker.template.TemplateException;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.Writer;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service("tulingItemServiceImpl")
public class ItemServiceImpl implements ItemService {

    @Autowired
    private PmsProductMapper productMapper;


    @Override
    public String toStatic(Long id) {
        //查询商品信息
        PmsProduct pmsProduct = productMapper.selectById(id);
        if (pmsProduct == null) {
            return null;
        }
        String outPath = "";
        try {
            String userHome = System.getProperty("user.home");
            // 第一步：创建一个Configuration对象，直接new一个对象。构造方法的参数就是freemarker对于的版本号。
            Configuration configuration = new Configuration(Configuration.getVersion());

            // 第二步：设置模板文件所在的路径。
            configuration.setDirectoryForTemplateLoading(new File(userHome + "/template/ftl"));

            // 第三步：设置模板文件使用的字符集。一般就是utf-8.
            configuration.setDefaultEncoding("utf-8");

            // 第四步：加载一个模板，创建一个模板对象。
            Template template = null;

            template = configuration.getTemplate("report.ftl");
            // 第五步：创建一个模板使用的数据集，可以是pojo也可以是map。一般是Map。
            Map dataModel = new HashMap();
            // 向数据集中添加数据
            dataModel.put("item", pmsProduct);

            String images = pmsProduct.getPic();
            if (StringUtils.isNotEmpty(images)) {
                String[] split = images.split(",");
                List<String> imageList = Arrays.asList(split);
                dataModel.put("imageList", imageList);
            }

            // 第六步：创建一个Writer对象，一般创建一FileWriter对象，指定生成的文件名。
            outPath = userHome + "/template/report/1000" + pmsProduct.getId() + ".html";
            Writer out = new FileWriter(new File(outPath));
            // 第七步：调用模板对象的process方法输出文件。
            template.process(dataModel, out);
            // 第八步：关闭流。
            out.close();
        } catch (IOException e) {
            e.printStackTrace();
        } catch (TemplateException te) {
            te.printStackTrace();
        }
        return outPath;
    }
}
