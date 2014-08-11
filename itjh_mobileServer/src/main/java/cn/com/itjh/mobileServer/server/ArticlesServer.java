package cn.com.itjh.mobileServer.server;

import java.util.List;
import java.util.concurrent.ExecutionException;

import javax.annotation.Resource;
import javax.ws.rs.Consumes;
import javax.ws.rs.FormParam;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

import net.rubyeye.xmemcached.MemcachedClient;

import org.apache.log4j.Logger;
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

    private static final Logger logger = Logger.getLogger(ArticlesServer.class.getName());

    @Resource
    private ArticlesService articlesService;

    @Resource
    private MemcachedClient memcachedClient;

    Gson gson = new Gson();

    /**
     * 
     * 获取“编程感悟”的文章列表. <br>
     * 详细说明
     * 
     * @Copyright itjh
     * @Project
     * @return
     * @throws InterruptedException
     * @throws ExecutionException
     * @return String
     * @throws
     * @author 宋立君
     * @date 2014年8月11日 上午10:03:23
     * @Version
     * @JDK version used 8.0
     * @Modification history none
     * @Modified by none
     */
    @GET
    @Produces("application/json")
    @Consumes(MediaType.APPLICATION_FORM_URLENCODED)
    @Path("getArticlesByProgrammingInsights")
    public String getArticlesByProgrammingInsights() {
        String articlesJson = null;
        try {
            logger.info("开始获取“编程感悟”文章列表");
            // 从缓存中获取编程的json数据
            String memArticlesJson = memcachedClient.get("articles_bcgw");
            if ("".equals(memArticlesJson) || null == memArticlesJson) {
                List<Articles> articles = articlesService.getArticlesByProgrammingInsights();
                articlesJson = gson.toJson(articles);
                // 把编程感悟的文章列表json存放到memcached中，缓存时间为6个小时
                if (null != articles && articles.size() != 0) {
                    memcachedClient.set("articles_bcgw", 60 * 60 * 6, articlesJson);
                    logger.info("编程感悟列表成功缓存到memcached中,缓存内容是：\n");
                    //logger.info(articlesJson);
                }
            } else {
                logger.info("从缓存中获取“编程感悟”文章列表");
                return memArticlesJson;
            }
        } catch (Exception e) {
            logger.error("获取“编程感悟”文章列表失败\n");
            logger.equals(e.getMessage());
            e.printStackTrace();
        }
        return articlesJson;
    }

    /**
     * 
     * 获取单个文章. <br>
     * 获取单个文章
     * 
     * @Copyright itjh
     * @Project
     * @param artticsId
     *            文章ID
     * @param termId
     *            分类ID
     * @return
     * @return String
     * @throws
     * @author 宋立君
     * @date 2014年8月11日 下午3:46:32
     * @Version
     * @JDK version used 8.0
     * @Modification history none
     * @Modified by none
     */
    @POST
    @Produces("application/json")
    @Consumes(MediaType.APPLICATION_FORM_URLENCODED)
    @Path("getArticlesByArtticsId")
    public String getArticlesByArtticsId(@FormParam(value = "termId") String termId,@FormParam(value = "artticsId") String artticsId) {

        logger.info("文章分类ID:" + termId);
        logger.info("文章ID:" + artticsId);
        String articlesJson = "";
        try {
            
            String articlesJsonMen = memcachedClient.get(termId+artticsId);
            if ("".equals(articlesJsonMen) || null == articlesJsonMen) {
                Articles articles = articlesService.getArticlesByArtticsId(termId,artticsId);
                articlesJson = gson.toJson(articles);
                // 把编程感悟的文章列表json存放到memcached中，缓存时间为6个小时
                if (null != articles) {
                    memcachedClient.set(termId+artticsId, 0, articlesJson);
                    logger.info("编程感悟列表成功缓存到memcached中");
                    //logger.info("缓存内容是：\n"+articlesJson);
                }
            } else {
                logger.info("从缓存中获取“编程感悟”文章列表");
                return articlesJsonMen;
            }
        } catch (Exception e) {
            e.printStackTrace();
            return articlesJson;
        }
        return articlesJson;
    }
}
