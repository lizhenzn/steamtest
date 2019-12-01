package index;
import java.util.*;
import databeans.*;
//class GameItem{
//	public String img;
//	public String name;
//	public GameItem(String img,String name) {
//		this.img=img;
//		this.name=name;
//	}
//	public GameItem() {}
//}
public class GameList {
	private  ArrayList<GameInfo> game_list=new ArrayList<GameInfo>();
	private  int page=0;
//	public  void addItem(String img,String name) {
//		GameInfo gameInfo=new GameInfo(img,name);
//		game_list.add(gameItem);
//	}
	public  void addItem(GameInfo gameInfo) {
		game_list.add(gameInfo);
	}
	public  GameInfo getGameItem(int num) {
		if(num+page*8 >= game_list.size())
			return null;
		return game_list.get(num+page*8);
	}
	public  void nextPage() {
		if((page+1)*8 >= game_list.size())
			return ;
		page++;
	}
	public  void lastPage() {
		if(page>0)
			page--;
	}
	public  String getImg(int num) {
		if(getGameItem(num)!=null)
			return getGameItem(num).getImg1();
		else
			return null;
	}
	public  String getName(int num) {
		if(getGameItem(num)!=null)
			return getGameItem(num).getName();
		else
			return null;
	}
}