package cn.com.itjh.mobileServer.server;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ExecutionException;

import javax.annotation.Resource;
import javax.ws.rs.Consumes;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

import org.springframework.stereotype.Repository;

import cn.com.itjh.mobileServer.domain.Articles;
import cn.com.itjh.mobileServer.service.ArticlesService;

import com.google.gson.Gson;

/**
 * 
 * 文章的服务接口. <br>
 * 详细说明
 * 
 * @Copyright itjh
 * @Project
 * @author 宋立君
 * @date 2014年8月7日 下午5:48:55
 * @Version
 * @JDK version used 8.0
 * @Modification history none
 * @Modified by none
 */
@Repository
@Path("ArticlesServer")
public class ArticlesServer {

    @Resource
    private ArticlesService articlesService;

    Gson gson = new Gson();

    @GET
    @Produces("application/json")
    @Consumes(MediaType.APPLICATION_FORM_URLENCODED)
    @Path("getArticlesByProgrammingInsights")
    public String getArticlesByProgrammingInsights() throws InterruptedException, ExecutionException {

        List<Articles> articles = articlesService.getArticlesByProgrammingInsights();
        String articlesJson = gson.toJson(articles);
  
//        Map<String, List> map = new HashMap<String, List>();
//        map.put("articles", articles);
//        String articlesJson = gson.toJson(map);
System.out.println(new Date() + "请求	");
        return articlesJson;

    }

}
