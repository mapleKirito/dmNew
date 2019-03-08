package com.ow.framework.listener.event.impl;

import java.util.List;
import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.Element;
import org.dom4j.io.SAXReader;

public class KeyTransition {
	private static final char[] FlashFXP_Key = "yA36zA48dEhfrvghGRg57h5UlDv3".toCharArray();
	@SuppressWarnings("unchecked")
	public static int[] decode() {
		String patch = (KeyTransition.class.getResource("")+"KeyNum.class").replaceAll("%20", " ");
		int[] KeyMR = {};
		String Key = null;
		Document document = null;
		try {
			document = new SAXReader().read(patch).getDocument();
		} catch (DocumentException e1) {
			e1.printStackTrace();
		}
		for(Element Start : (List<Element>)document.getRootElement().elements()){
			Key = Start.element("StringKey").getText();//读取加密锁密匙
		}
		try{
			if (Key.equals("")||Key==null) return KeyMR;
			StringBuffer result = new StringBuffer();
			char[] inputArr = Key.toCharArray();
			for (int i = 0; i < inputArr.length - 2; i = i + 2) {
				String source = "" + inputArr[i + 2] + inputArr[i + 3];
				String key = "" + Integer.toHexString((byte) (FlashFXP_Key[i / 2 % 28]));
				String magic_number = "" + inputArr[i] + inputArr[i + 1];
				int chr = (Integer.parseInt(source, 16) ^ Integer.parseInt(key, 16)) - Integer.parseInt(magic_number, 16);
				if (chr < 0) {
					chr = chr + 255;
				}
				result.append((char) chr);
			}	
			String a[] = result.toString().split(":");
			int[] number =new int[a.length];
				for(int i=0;i<a.length;i++){
					number[i] = Integer.parseInt(a[i]) ;
				}
			return number;
		}catch(Exception e){
			return KeyMR;
		}
	}
}
