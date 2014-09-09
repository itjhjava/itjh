package cn.com.itjh.mobileServer.service;

import java.util.List;

import cn.com.itjh.mobileServer.domain.Articles;

/**
 * 
 * 操作文章的Service. <br>
 * vs
 * 
 * @Copyright itjh
 * @Project
 * @author 宋立君
 * @date 2014年8月7日 下午5:41:15
 * @Version
 * @JDK version used 8.0
 * @Modification history none
 * @Modified by none
 */
public interface ArticlesService {
    /**
     * 
     * 获取文章. <br>
     * 根据’编程感悟‘分类获取文章
     * 
     * @param showNum
     *            显示条数
     * @param pageNum
     *            当前页数
     * 
     * @Copyright itjh
     * @Project
     * @return
     * @return List<ArrayList> 文章的列表
     * @throws
     * @author 宋立君
     * @date 2014年8月7日 下午3:43:40
     * @Version
     * @JDK version used 8.0
     * @Modification history none
     * @Modified by none
     */
    List<Articles> getArticlesByProgrammingInsights(int pageNum, int showNum);

    /**
     * 
     * 获取单个文章. <br>
     * 根据文章ID获取文章详情
     * 
     * @Copyright
     * @Project
     * @param artticsId
     *            文章ID
     * @return
     * @return Articles 文章对象
     * @throws
     * @author 宋立君
     * @date 2014年8月11日 下午3:49:25
     * @Version
     * @JDK version used 8.0
     * @Modification history none
     * @Modified by none
     */
    Articles getArticlesByArtticsId(String artticsId);

    /**
     * 
     * 获取移动开发的文章列表. <br>
     * 获取移动开发的文章列表
     * 
     * @param showNum
     * @param pageNum
     * @Copyright itjh
     * @Project
     * @return
     * @return List<Articles>
     * @throws
     * @author 宋立君
     * @date 2014年8月13日 下午2:23:21
     * @Version
     * @JDK version used 8.0
     * @Modification history none
     * @Modified by none
     */
    List<Articles> getArticlesByMoblieDevelopment(int pageNum, int showNum);

    /**
     * 
    * 获取最新发布的文章.
    * <br>获取最新发布的文章
    * @Copyright vcinema
    * @Project
    * @param pageNum
    * @param showNum
    * @return
    * @return List<Articles> 
    * @throws
    * @author 宋立君
    * @date 2014年9月9日 下午2:52:52
    * @Version 
    * @JDK version used 8.0
    * @Modification history none
    * @Modified by none
     */
    List<Articles> getArticlesByNew(int pageNum, int showNum);
}
