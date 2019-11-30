package index;
import java.util.*;
class GameItem{
	public String img;
	public String name;
	public GameItem(String img,String name) {
		this.img=img;
		this.name=name;
	}
	public GameItem() {}
}
public class GameList {
	private  ArrayList<GameItem> game_list=new ArrayList<GameItem>();
	private  int page=0;
	public  void addItem(String img,String name) {
		GameItem gameItem=new GameItem(img,name);
		game_list.add(gameItem);
	}
	public  GameItem getGameItem(int num) {
		if(num+page*5 >= game_list.size())
			return null;
		return game_list.get(num+page*5);
	}
	public  void nextPage() {
		if((page+1)*5 >= game_list.size())
			return ;
		page++;
	}
	public  void lastPage() {
		if(page>0)
			page--;
	}
	public  String getImg(int num) {
		if(getGameItem(num)!=null)
			return getGameItem(num).img;
		else
			return null;
	}
	public  String getName(int num) {
		if(getGameItem(num)!=null)
			return getGameItem(num).name;
		else
			return null;
	}
}
