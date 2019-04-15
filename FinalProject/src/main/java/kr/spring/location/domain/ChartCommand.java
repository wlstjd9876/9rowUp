package kr.spring.location.domain;

public class ChartCommand {
	
	private String go_type;
	private int count;
		
	public String getGo_type() {
		return go_type;
	}
	public void setGo_type(String go_type) {
		this.go_type = go_type;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	
	@Override
	public String toString() {
		return "ChartCommand [go_type=" + go_type + ", count=" + count + "]";
	}	
}
