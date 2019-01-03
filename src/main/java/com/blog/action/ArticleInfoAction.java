package com.blog.action;

import com.blog.service.ArticleInfoService;
import com.blog.service.TypeInfoService;
import com.blog.view.ArticleInfo;
import com.blog.view.Result;
import com.google.gson.Gson;
import com.qiniu.common.QiniuException;
import com.qiniu.common.Zone;
import com.qiniu.http.Response;
import com.qiniu.storage.Configuration;
import com.qiniu.storage.UploadManager;
import com.qiniu.storage.model.DefaultPutRet;
import com.qiniu.util.Auth;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.List;

/**
 * Created by heanxing on 2018/12/28.
 */
@Controller
@RequestMapping("article")
public class ArticleInfoAction {

    @Autowired
    private ArticleInfoService articleInfoService;
    @Autowired
    private TypeInfoService typeInfoService;


    @RequestMapping("list.action")
        public String listNomal(ModelMap map){
        List<ArticleInfo> list = articleInfoService.listNormal();
        map.put("list",list);
        return "admin/article/list";

    }

    @RequestMapping("edit.action")
    public String edit(ModelMap map, @RequestParam( required = false ,value = "id") String id){
            //差单个文章信息
        //判断是新增还是更新文章
        if (StringUtils.isEmpty(id)){
            ArticleInfo articleInfo = articleInfoService.selectById(id);
            map.put("articleInfo",articleInfo);

        }
        map.put("typeList",typeInfoService.list());
        return "admin/article/edit";

    }

    //上传到磁盘
    /**
     * 上传文件到七牛云
     * @throws IOException
     */
    @RequestMapping("upload.json")
    @ResponseBody
    public Result upload(MultipartFile file) throws IOException {

        /**
         * 构造一个带指定Zone对象的配置类
         * 华东 : Zone.zone0()
         * 华北 : Zone.zone1()
         * 华南 : Zone.zone2()
         * 北美 : Zone.zoneNa0()
         */
        Configuration cfg = new Configuration(Zone.zone0());
        // ...其他参数参考类注释
        UploadManager uploadManager = new UploadManager(cfg);
        // ...生成上传凭证，然后准备上传
        String accessKey = "46xdFjGnbJ2uRwpYT5-inPD-4YmFzRbdioFl00gQZ";
        String secretKey = "hH0XVgdaah3qbdfnATq03cHYLor5qQOJ_GQDvPnm";
        String bucket = "mytest1";
        // 默认不指定key的情况下，以文件内容的hash值作为文件名
        String key = null;

        String imgUrl = "";
        try {
            // 数据流上传
            InputStream byteInputStream = file.getInputStream();
            Auth auth = Auth.create(accessKey, secretKey);
            String upToken = auth.uploadToken(bucket);
            try {
                com.qiniu.http.Response response = uploadManager.put(byteInputStream, key, upToken, null, null);
                // 解析上传成功的结果
                DefaultPutRet putRet = new Gson().fromJson(response.bodyString(), DefaultPutRet.class);
                System.out.println(putRet.key);
                System.out.println(putRet.hash);
                imgUrl = putRet.hash;
            } catch (QiniuException ex) {
                Response r = ex.response;
                System.err.println(r.toString());
                try {
                    System.err.println(r.bodyString());
                } catch (QiniuException ex2) {
                    // ignore
                }
            }
        } catch (UnsupportedEncodingException ex) {
            // ignore
        }

        return Result.success().add("imgUrl", imgUrl);
    }

}
