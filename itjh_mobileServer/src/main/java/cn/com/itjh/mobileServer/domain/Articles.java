package cn.com.itjh.mobileServer.domain;

/**
 * 
 * 文章实体类. <br>
 * 文章实体类
 * 
 * @Copyright itjh
 * @Project itjh_mobileServer
 * @author 宋立君
 * @date 2014年8月7日 下午3:26:10
 * @Version v0.1
 * @JDK version used 8.0
 * @Modification history none
 * @Modified by none
 */
public class Articles {

    private String id; // 文章ID

    private String content; // 文章内容
    
    private String title; // 文章标题

    private String author; // 文章作者

    private String postDate;// 发布日期

    private String source;// 文章来源

    private String popularity; // 文章人气
    
    private String comments; // 文章评论

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getAuthor() {
        return author.equals("1") ==true ? "江湖" :"佚名";
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getPostDate() {
        return postDate;
    }

    public void setPostDate(String postDate) {
        this.postDate = postDate;
    }

    public String getSource() {
        return source;
    }

    public void setSource(String source) {
        this.source = source;
    }

    public String getPopularity() {
        return popularity;
    }

    public void setPopularity(String popularity) {
        this.popularity = popularity;
    }

    public String getComments() {
        return comments;
    }

    public void setComments(String comments) {
        this.comments = comments;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

	@Override
	public String toString() {
		return "Articles [id=" + id + ", content=" + content + ", title="
				+ title + ", author=" + author + ", postDate=" + postDate
				+ ", source=" + source + ", popularity=" + popularity
				+ ", comments=" + comments + "]";
	}

	public Articles(String id, String content, String title, String author,
			String postDate, String source, String popularity, String comments) {
		super();
		this.id = id;
		this.content = content;
		this.title = title;
		this.author = author;
		this.postDate = postDate;
		this.source = source;
		this.popularity = popularity;
		this.comments = comments;
	}

	public Articles() {
		super();
	}
    
	
}
