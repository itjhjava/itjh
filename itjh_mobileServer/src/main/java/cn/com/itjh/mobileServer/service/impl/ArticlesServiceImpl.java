package cn.com.itjh.mobileServer.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import cn.com.itjh.mobileServer.dao.ArticlesDao;
import cn.com.itjh.mobileServer.domain.Articles;
import cn.com.itjh.mobileServer.service.ArticlesService;

/**
 * 
* 操作文章的Service实现类.
* <br>操作文章的Service实现类
* @Copyright itjh
* @Project
* @author 宋立君
* @date 2014年8月7日 下午5:42:10
* @Version 
* @JDK version used 8.0
* @Modification history none
* @Modified by none
 */
@Service
public class ArticlesServiceImpl implements ArticlesService {

    @Resource
    private ArticlesDao ArticlesDao;
    
    @Override
    public List<Articles> getArticlesByProgrammingInsights() {
        
        List<Articles>  articles =  ArticlesDao.getArticlesByProgrammingInsights();
        
        for (Articles articles2 : articles) {
            articles2.setAuthor("江湖");
            articles2.setPostDate(articles2.getPostDate().substring(0, 10));
            articles2.setContent((articles2.getContent().substring(200, 300)));
            System.out.println(articles2.getPostDate().substring(0, 10));
            System.out.println(articles2.getTitle());
        }
        
        return articles;
    }

}
