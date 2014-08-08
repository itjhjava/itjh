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
