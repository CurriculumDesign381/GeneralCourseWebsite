package login;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sun.image.codec.jpeg.JPEGCodec;
import com.sun.image.codec.jpeg.JPEGImageEncoder;

/**
 * Servlet implementation class CreateSercurityCode
 */
@WebServlet("/CreateSercurityCode")
public class CreateSercurityCode extends HttpServlet {
	public static final char[] chars={'2','3','4','5','6','7','8','9','A','B','C','D'};//�Զ�����֤���
	public static Random random = new Random();//�����
	
	/*��ȡ4λ�����*/
	public static String getRandomString() {
		StringBuffer buffer = new StringBuffer();
		for (int i = 0; i < 4; i++) {
			buffer.append(chars[random.nextInt(chars.length)]);
		}
		return buffer.toString();
	}
	
	/*��ȡ�������ɫ*/
	 public static Color getRandomColor(){
	        return new Color(random.nextInt(255), random.nextInt(255), random.nextInt(255));
	}
	/*����ĳ��ɫ�ķ�ɫ*/
	 public static Color getReverseColor(Color c){
	        return new Color(255 - c.getRed(), 255 - c.getGreen(), 255 - c.getBlue());
	 }
	
    public CreateSercurityCode() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        response.setContentType("image/jpeg"); //�����������
        
        String randomString = getRandomString(); //����ַ���
        request.getSession(true).setAttribute("randomString", randomString);//�ŵ�session��
        
        int width=100; //ͼƬ���
        int height=30; //ͼƬ�߶�
        
        Color color=getRandomColor(); //�����ɫ�����ڱ���ɫ
        Color reverse=getReverseColor(color);//��ɫ������ǰ��ɫ
        //����һ����ɫͼƬ
        BufferedImage bi=new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
        Graphics2D g=bi.createGraphics(); //��ͼ����
        g.setFont(new Font(Font.SANS_SERIF,Font.BOLD,16));//��������
        g.setColor(color);//������ɫ
        g.fillRect(0, 0, width, height);//���Ʊ���
        g.setColor(reverse);
        g.drawString(randomString, 18, 20);//��������ַ�
        for(int i=0,n=random.nextInt(100);i<n;i++){ //�����100��������
            g.drawRect(random.nextInt(width), random.nextInt(height), 1, 1);
        }
        ServletOutputStream out= response.getOutputStream();//ת��JPEG��ʽ
        JPEGImageEncoder encoder=JPEGCodec.createJPEGEncoder(out);//������
        encoder.encode(bi); //��ͼƬ���б���
        out.flush();//������ͻ���
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
