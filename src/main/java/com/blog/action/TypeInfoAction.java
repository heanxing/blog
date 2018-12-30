package com.blog.action;

import com.blog.service.TypeInfoService;
import com.blog.view.Result;
import com.blog.view.TypeInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * Created by heanxing on 2018/12/28.
 */
@Controller
@RequestMapping("type")
public class TypeInfoAction {

    @Autowired
    private TypeInfoService typeInfoService;


    @RequestMapping("list.action")
        public String list(ModelMap map){
        List<TypeInfo> list = typeInfoService.list();
        map.put("list",list);
        return "admin/type/list";

    }


    @RequestMapping("save.json")
    @ResponseBody
    public Result save(
            @RequestParam(value = "idArr") String[] idArr,
            @RequestParam(value = "sortArr") String[] sortArr,
            @RequestParam(value = "nameArr") String[] nameArr
            )
    {
            typeInfoService.save(idArr,sortArr,nameArr);
            return Result.success();

    }

    @RequestMapping("delete.json")
    @ResponseBody
    public Result delete(
            @RequestParam(value = "idArr") String[] idArr)

    {
        typeInfoService.delete(idArr);
        return Result.success();

    }
}
