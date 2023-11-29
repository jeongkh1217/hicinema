package hicinema.communityreply.vo;

public class Communityreplygetset {
	int replyno;
	int postno;
	String replyid;
	String replypost;
	String replywrittendate;
	public int getReplyno() {
		return replyno;
	}
	public void setReplyno(int replyno) {
		this.replyno = replyno;
	}
	public int getPostno() {
		return postno;
	}
	public void setPostno(int postno) {
		this.postno = postno;
	}
	public String getReplyid() {
		return replyid;
	}
	public void setReplyid(String replyid) {
		this.replyid = replyid;
	}
	public String getReplypost() {
		return replypost;
	}
	public void setReplypost(String replypost) {
		this.replypost = replypost;
	}
	public String getReplywrittendate() {
		return replywrittendate;
	}
	public void setReplywrittendate(String replywrittendate) {
		this.replywrittendate = replywrittendate;
	}
	
	
	public void resetValues() {
        this.replyid = null;
        this.postno = 0;
        this.replypost = null;
        this.replywrittendate = null;
    }
}
	


