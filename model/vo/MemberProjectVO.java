package model.vo;

public class MemberProjectVO {
	private String mid;
	private String mpw;
	private String mname;
	private String act;
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	public String getMpw() {
		return mpw;
	}
	public void setMpw(String mpw) {
		this.mpw = mpw;
	}
	public String getMname() {
		return mname;
	}
	public void setMname(String mname) {
		this.mname = mname;
	}
	public String getAct() {
		return act;
	}
	public void setAct(String act) {
		this.act = act;
	}
	@Override
	public String toString() {
		return "MemberProjectDAO [mid=" + mid + ", mpw=" + mpw + ", mname=" + mname + ", act=" + act + "]";
	}
	
}
