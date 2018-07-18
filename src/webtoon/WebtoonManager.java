package webtoon;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
 
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import webtoon.WebtoonDTO;

public class WebtoonManager {
    public static List<WebtoonDTO> webtoonAllData() {
        
        List<WebtoonDTO> list = new ArrayList<WebtoonDTO>();
        
        try {
            Document naver_doc = Jsoup.connect("https://comic.naver.com/webtoon/weekday.nhn").get();	// ������ ������ ������                 
            Elements naver_title = naver_doc.select("div.list_area div.col div.col_inner ul li a.title");	// ���� ����            
            Elements naver_poster = naver_doc.select("div.list_area div.col div.col_inner ul li div.thumb img");	// ����� //select("img[src$=.png]")
            Elements naver_url = naver_doc.select("div.list_area div.col div.col_inner ul li a.title");
            
            for (int i = 0; i < naver_title.size(); i++) {
                
                if(i > naver_title.size()) break;
                
                Element telem = naver_title.get(i);
                Element pelem = naver_poster.get(i);               
                String img = pelem.attr("src");		//    img �±׾ȿ� �ִ� ������ src �� �����´�.
                Element uelem = naver_url.get(i);
                String href = uelem.attr("href");	              
                WebtoonDTO vo = new WebtoonDTO();	 //    �����͸� ����, DTO�� ������ �� DTO�� �������� setter�� �̿��ؼ� �ϳ��� �ֵ��� �Ѵ�. 
                vo.setNumber(i + 1);	//    ��ȣ ���� (1������ �ֵ��� �Ѵ�.)
                vo.setPoster(img);
                vo.setTitle(telem.text());
                vo.setUrl(href);
                     
                list.add(vo);
                } 
        }
            
           // for(WebtoonDTO m : list) {
          //  	System.out.println(m.toString());
           // 	}
  
            
            catch (IOException e) {
        	// TODO Auto-generated catch block
        	e.printStackTrace();
        	}
                
              return list;        
          
    }
    
    
    
        public static List<WebtoonDTO> webtoonDaumData() {
            
            List<WebtoonDTO> daum_list = new ArrayList<WebtoonDTO>();    
        try {
            Document daum_doc = Jsoup.connect("https://comic.naver.com/webtoon/weekday.nhn").get();
            Elements daum_title = daum_doc.select("div.list_area div.col div.col_inner ul li a.title ");	// ���� ����            
            Elements daum_poster = daum_doc.select("div.list_area div.col div.col_inner ul li div.thumb img");	// �����
            Elements daum_url = daum_doc.select("div.list_area div.col div.col_inner ul li a.title");
            
            for (int i = 0; i < daum_title.size(); i++) {
                
                if(i > daum_title.size()) break;
                
                Element telem = daum_title.get(i);
                Element pelem = daum_poster.get(i);
                //    img �±׾ȿ� �ִ� ������ src �� �����´�.
                String img = pelem.attr("src");	
                Element uelem = daum_url.get(i);
                String href2 = uelem.attr("href");	
                //    �����͸� ���� 
                //    DTO�� ������ �� DTO�� �������� setter�� �̿��ؼ� �ϳ��� �ֵ��� �Ѵ�. 
                WebtoonDTO vo2 = new WebtoonDTO();
                vo2.setNumber(i+300);	//    ��ȣ ���� (1������ �ֵ��� �Ѵ�.)
                vo2.setPoster(img);
                vo2.setTitle(telem.text());
                vo2.setUrl(href2);
                     
                daum_list.add(vo2);
                }
        }
        
            catch (IOException e) {
            	// TODO Auto-generated catch block
            	e.printStackTrace();
            	}
            
      
        return daum_list;        
        
        }  
    
    
    
    /*---------------------------------------------------------------
     * ���� �󼼺���
     * ---------------------------------------------------------------*/
    
    //    �ش� ��ȣ�� ���� ������ ���������� �Ѵ�. 
    //    ��ȣ�� 1�� ���� �����߱� ������ no=1�� �ش��ϴ� �����ʹ� 0������ ���� �Ǿ��ִ�. 
    //    ���� 1�� �����͸� Ŭ�� �� 0������ �ش��ϴ� �����͸� ������ �� �ֵ��� -1�� �ϵ��� �Ѵ�. 
    public static WebtoonDTO webtoonDetail(int no) {
        List<WebtoonDTO> list = webtoonAllData();
        WebtoonDTO vo = list.get(no-1);
        
        return vo;
    }
}

