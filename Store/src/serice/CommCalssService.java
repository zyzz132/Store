package serice;
import java.util.List;

import entity.CommClass;

public class CommCalssService {
	private int dqpage;//当前显示页面
	private int zpage;//总
	private int showcount;
	private String sql;
	private List<CommClass> CommClassS;
	public CommCalssService(int dqpage, int zpage, int showcount, List<CommClass> commClassS) {
		super();
		this.dqpage = dqpage;
		this.zpage = zpage;
		this.showcount = showcount;
		CommClassS = commClassS;
	}
	public CommCalssService() {
		super();
	}
	public int getDqpage() {
		return dqpage;
	}
	public void setDqpage(int dqpage) {
		this.dqpage = dqpage;
	}
	public int getZpage() {
		return zpage;
	}
	public void setZpage(int zpage) {
		if(this.zpage>showcount){
			this.zpage = this.zpage/showcount;
		}else{
			this.zpage=1;
		}
	}
	public int getShowcount() {
		return showcount;
	}
	public void setShowcount(int showcount) {
		
			this.showcount=showcount;
		
	}
	public List<CommClass> getCommClassS() {
		return CommClassS;
	}
	public void setCommClassS(List<CommClass> commClassS) {
		CommClassS = commClassS;
	}
	
	
	
	
}
