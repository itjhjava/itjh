package cn.com.itjh.mobileServer.server;

import java.util.List;
import java.util.concurrent.ExecutionException;

import javax.annotation.Resource;
import javax.ws.rs.Consumes;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
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
    @Path("getArticlesByProgrammingInsights/{pageNum}/{showNum}")
    public String getArticlesByProgrammingInsights(@PathParam(value = "pageNum") int pageNum,@PathParam(value = "showNum") int showNum) {
        String articlesJson = null;
        try {
            logger.info("开始获取“编程感悟”文章列表");
            // 从缓存中获取编程的json数据
            String memArticlesJson = memcachedClient.get("articles_bcgw_"+pageNum);
            if ("".equals(memArticlesJson) || null == memArticlesJson) {
                pageNum =pageNum*showNum;
                logger.info("开始" + pageNum);
                List<Articles> articles = articlesService.getArticlesByProgrammingInsights(pageNum,showNum);
                articlesJson = gson.toJson(articles);
                // 把编程感悟的文章列表json存放到memcached中，缓存时间为6个小时
                if (null != articles && articles.size() != 0) {
                   // memcachedClient.set("articles_bcgw"_pageNum, 60 * 60 * 6, articlesJson);
                    //logger.info("编程感悟列表成功缓存到memcached中,缓存内容是：\n");
                    // logger.info(articlesJson);
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
    * 获取移动开发的文章列表.
    * <br>获取移动开发的文章列表
    * @Copyright itjh
    * @Project
    * @return
    * @return String 
    * @throws
    * @author 宋立君
    * @date 2014年8月13日 下午2:21:54
    * @Version 
    * @JDK version used 8.0
    * @Modification history none
    * @Modified by none
     */
    @GET
    @Produces("application/json")
    @Consumes(MediaType.APPLICATION_FORM_URLENCODED)
    @Path("getArticlesByMoblieDevelopment/{pageNum}/{showNum}")
    public String getArticlesByMoblieDevelopment(@PathParam(value = "pageNum") int pageNum,@PathParam(value = "showNum") int showNum) {
        String articlesJson = null;
        try {
            logger.info("开始获取“移动开发”文章列表");
            // 从缓存中获取编程的json数据
            String memArticlesJson = memcachedClient.get("articles_ydkf_"+pageNum);
            if ("".equals(memArticlesJson) || null == memArticlesJson) {
                pageNum =pageNum*showNum;
                List<Articles> articles = articlesService.getArticlesByMoblieDevelopment(pageNum,showNum);
                articlesJson = gson.toJson(articles);
                // 把编程感悟的文章列表json存放到memcached中，缓存时间为6个小时
                if (null != articles && articles.size() != 0) {
                    //memcachedClient.set("articles_ydkf_"+pageNum, 60 * 60 * 6, articlesJson);
                    //logger.info("移动开发列表成功缓存到memcached中,缓存内容是：\n");
                    // logger.info(articlesJson);
                }
            } else {
                logger.info("从缓存中获取“移动开发”文章列表");
                return memArticlesJson;
            }
        } catch (Exception e) {
            logger.error("获取“移动开发”文章列表失败\n");
            logger.equals(e.getMessage());
            e.printStackTrace();
        }
        return articlesJson;
    }
    
    /**
     * 
     * 获取单个文章. <br>
     * 根据文章ID换取文章详情
     * 
     * @Copyright itjh
     * @Project
     * @param artticsId
     *            文章ID
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
    @GET
    @Produces("application/json")
    @Path("getArticlesByArtticsId/{artticsId}")
    public String getArticlesByArtticsId(@PathParam(value = "artticsId") String artticsId) {
        logger.info("文章ID:" + artticsId);
        String articlesJson = "";
        try {
            String articlesJsonMen = memcachedClient.get(artticsId);
            if ("".equals(articlesJsonMen) || null == articlesJsonMen) {
                Articles articles = articlesService.getArticlesByArtticsId(artticsId);
                articlesJson = gson.toJson(articles);
                // 把编程感悟的文章列表json存放到memcached中，缓存时间为6个小时
                if (null != articles) {
                    //memcachedClient.set(artticsId, 0, articlesJson);
                    //logger.info("文章id:"+artticsId+"成功缓存到memcached中");
                    // logger.info("缓存内容是：\n"+articlesJson);
                }
            } else {
                logger.info("从缓存中获取文章id:"+artticsId);
                return articlesJsonMen;
            }
        } catch (Exception e) {
            e.printStackTrace();
            return articlesJson;
        }
        return articlesJson;
    }
    
    /**
     * 
    * 查询最近更新的文章.
    * <br>查询最近更新的文章
    * @Copyright vcinema
    * @Project
    * @return
    * @return String 
    * @throws
    * @author 宋立君
    * @date 2014年9月9日 下午2:50:41
    * @Version 
    * @JDK version used 8.0
    * @Modification history none
    * @Modified by none
     */
    @GET
    @Produces("application/json")
    @Path("getArticlesByNew/{pageNum}/{showNum}")
    public String getArticlesByNew(@PathParam(value = "pageNum") int pageNum,@PathParam(value = "showNum") int showNum){
        String articlesJson = null;
        try {
            logger.info("开始获取最新发布的文章列表");
            // 从缓存中获取编程的json数据
            String memArticlesJson = memcachedClient.get("articles_new_"+pageNum);
            if ("".equals(memArticlesJson) || null == memArticlesJson) {
                pageNum =pageNum*showNum;
                List<Articles> articles = articlesService.getArticlesByNew(pageNum,showNum);
                articlesJson = gson.toJson(articles);
                // 把最新发布的文章列表json存放到memcached中，缓存时间为6个小时
                if (null != articles && articles.size() != 0) {
                    //memcachedClient.set("articles_new_"+pageNum, 60 * 60 * 6, articlesJson);
                    //logger.info("移动开发列表成功缓存到memcached中,缓存内容是：\n");
                    // logger.info(articlesJson);
                }
            } else {
                logger.info("从缓存中获取“移动开发”文章列表");
                return memArticlesJson;
            }
        } catch (Exception e) {
            logger.error("获取“移动开发”文章列表失败\n");
            logger.equals(e.getMessage());
            e.printStackTrace();
        }
        return articlesJson;
    }
    
}
