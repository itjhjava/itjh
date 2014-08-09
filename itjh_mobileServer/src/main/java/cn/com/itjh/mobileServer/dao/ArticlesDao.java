package cn.com.itjh.mobileServer.dao;

import java.util.List;

import cn.com.itjh.mobileServer.domain.Articles;

/**
 * 
* 操作文章.
* <br>详细说明
* @Copyright itjh
* @Project
* @author 宋立君
* @date 2014年8月7日 下午3:39:51
* @Version 
* @JDK version used 8.0
* @Modification history none
* @Modified by none
 */
public interface ArticlesDao {

    /**
     * 
    * 获取文章.
    * <br>根据’编程感悟‘分类获取文章
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
    List<Articles> getArticlesByProgrammingInsights();
}
