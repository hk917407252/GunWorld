package dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import entity.Weapon;
import utils.JDBCHelper;

public class WeaponDao {
	
	int lpage_size=7,hpage_size=3,cpage_size=5,spage_size=15;
	public WeaponDao() {
		
	}
	
	
	/**
	 * 加载所有武器型号
	 * */
	public List<Weapon> loadAll(){
		List<Weapon> weaponList = new ArrayList<Weapon>();
		String sql = " select * from weapon ";
		ResultSet rs = JDBCHelper.query(sql);
		try {
			while(rs.next()) {
				Weapon weapon = new Weapon();
				weapon.setModel(rs.getString("model"));
				weapon.setName(rs.getString("name"));
				weapon.setCaliber(rs.getString("caliber"));
				weapon.setType(rs.getString("type"));
				weapon.setVariety(rs.getString("variety"));
				weapon.setDetail(rs.getString("detail"));
				weapon.setRoute(rs.getString("route"));
				weaponList.add(weapon);
			}
			rs.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return weaponList;
	}
	
	/**
	 * 获取轻武器的武器数据数量
	 * */
	public int loadLightWeaponNumber(){
		String sql = " select count(*) from weapon where type = '轻武器'";
		ResultSet rs = JDBCHelper.query(sql);
		int count = 0;
		try {
			while(rs.next()) {
				count = rs.getInt(1);
			}
			rs.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return count;
	}
	
	/**
	 * 加载当前页面轻武器信息
	 * */
	public List<Weapon> loadAllLightWeapon(int page){
		List<Weapon> weaponList = new ArrayList<Weapon>();
		String sql = " select top ? * from weapon where type = '轻武器' and model not in "
				+ "(select top ? model from weapon where type = '轻武器')";
		ResultSet rs = JDBCHelper.query(sql,this.lpage_size,this.lpage_size*(page - 1));
		try {
			while(rs.next()) {
				Weapon weapon = new Weapon();
				weapon.setModel(rs.getString("model"));
				weapon.setName(rs.getString("name"));
				weapon.setCaliber(rs.getString("caliber"));
				weapon.setType(rs.getString("type"));
				weapon.setVariety(rs.getString("variety"));
				weapon.setDetail(rs.getString("detail"));
				weapon.setRoute(rs.getString("route"));
				weaponList.add(weapon);
			}
			rs.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return weaponList;
	}
	
	/**
	 * 获取重武器的武器数据数量
	 * */
	public int loadHeavenWeaponNumber(){
		String sql = " select count(*) from weapon where type = '重武器'";
		ResultSet rs = JDBCHelper.query(sql);
		int count = 0;
		try {
			while(rs.next()) {
				count = rs.getInt(1);
			}
			rs.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return count;
	}
	
	/**
	 * 加载当前页面重武器信息
	 * */
	public List<Weapon> loadAllHeavenWeapon(int page){
		List<Weapon> weaponList = new ArrayList<Weapon>();
		String sql = " select top ? * from weapon where type = '重武器' and model not in "
				+ "(select top ? model from weapon where type = '重武器')";
		ResultSet rs = JDBCHelper.query(sql,this.hpage_size,this.hpage_size*(page - 1));
		try {
			while(rs.next()) {
				Weapon weapon = new Weapon();
				weapon.setModel(rs.getString("model"));
				weapon.setName(rs.getString("name"));
				weapon.setCaliber(rs.getString("caliber"));
				weapon.setType(rs.getString("type"));
				weapon.setVariety(rs.getString("variety"));
				weapon.setDetail(rs.getString("detail"));
				weapon.setRoute(rs.getString("route"));
				weaponList.add(weapon);
			}
			rs.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return weaponList;
	}
	
	/**
	 * 获取冷兵器的武器数据数量
	 * */
	public int loadColdWeaponNumber(){
		String sql = " select count(*) from weapon where type = '冷兵器'";
		ResultSet rs = JDBCHelper.query(sql);
		int count = 0;
		try {
			while(rs.next()) {
				count = rs.getInt(1);
			}
			rs.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return count;
	}
	
	/**
	 * 加载当前页面冷兵器信息
	 * */
	public List<Weapon> loadAllColdWeapon(int page){
		List<Weapon> weaponList = new ArrayList<Weapon>();
		String sql = " select top ? * from weapon where type = '冷兵器' and model not in "
				+ "(select top ? model from weapon where type = '冷兵器')";
		ResultSet rs = JDBCHelper.query(sql,this.cpage_size,this.cpage_size*(page - 1));
		try {
			while(rs.next()) {
				Weapon weapon = new Weapon();
				weapon.setModel(rs.getString("model"));
				weapon.setName(rs.getString("name"));
				weapon.setCaliber(rs.getString("caliber"));
				weapon.setType(rs.getString("type"));
				weapon.setVariety(rs.getString("variety"));
				weapon.setDetail(rs.getString("detail"));
				weapon.setRoute(rs.getString("route"));
				weaponList.add(weapon);
			}
			rs.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return weaponList;
	}
	
	/**
	 * 根据武器型号加载武器数据
	 * */
	public Weapon loadByModel(String model) {
		String sql = " select * from weapon where model like ? ";
		ResultSet rs = JDBCHelper.query(sql,model);
		Weapon weapon = null;
		try {
			while(rs.next()) {
				weapon = new Weapon();
				weapon.setModel(model);
				weapon.setName(rs.getString("name"));
				weapon.setCaliber(rs.getString("caliber"));
				weapon.setType(rs.getString("type"));
				weapon.setVariety(rs.getString("variety"));
				weapon.setDetail(rs.getString("detail"));
				weapon.setRoute(rs.getString("route"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return weapon;
	}
	
	/**
	 * 根据输入的搜索内容计算模糊查询加载武器得数据数目
	 * */
	public int loadByInputNumber(String input){
		String sql = " select count(*) from weapon where name like ? or type like ? or model like ? or caliber like ?";
		ResultSet rs = JDBCHelper.query(sql,'%'+input+'%','%'+input+'%','%'+input+'%','%'+input+'%');
		int count = 0;
		try {
			while(rs.next()) {
				count = rs.getInt(1);
			}
			rs.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return count;
	}
	
	/**
	 * 根据输入的搜索内容模糊查询加载武器数据
	 * */
	public List<Weapon> loadByInput(String input,int page){
		List<Weapon> weaponList = new ArrayList<Weapon>();
		String sql = " select top ? * from weapon where (name like ? or type like ?  or model like ? or caliber like ?) and model not in "
					+"(select top ? model from weapon where name like ? or type like ?  or model like ? or caliber like ? )";
		ResultSet rs = JDBCHelper.query(sql,spage_size,'%'+input+'%','%'+input+'%','%'+input+'%','%'+input+'%',
										spage_size*(page-1),'%'+input+'%','%'+input+'%','%'+input+'%','%'+input+'%');
		try {
			while(rs.next()) {
				Weapon weapon = new Weapon();
				weapon.setModel(rs.getString("model"));						
				weapon.setName(rs.getString("name"));
				weapon.setCaliber(rs.getString("caliber"));
				weapon.setType(rs.getString("type"));
				weapon.setVariety(rs.getString("variety"));
				weapon.setDetail(rs.getString("detail"));
				weapon.setRoute(rs.getString("route"));
				weaponList.add(weapon);
			}
			rs.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return weaponList;
	}
	
	/**
	 * 插入武器数据
	 * */
	public boolean insert(String model,String name,String caliber,String type,String variety,String detail,String route) {
		boolean b = false;
		if(!"".equals(model)&&!"".equals(name)&&!"".equals(caliber)&&!"".equals(type)&&!"".equals(variety)&&!"".equals(detail)&&!"".equals(route)) {
			String sql = " insert into weapon (model,name,caliber,type,variety,detail,route) values(?,?,?,?,?,?,?) ";
			b = JDBCHelper.execute(sql,model,name,caliber,type,variety,detail,route );
		}
		return b;
	}
	
	/**
	 * 更新武器数据
	 * */
	public boolean update(String model,String name,String caliber,String type,String variety,String detail,String route) {
		boolean b = false;
		if(!"".equals(model)&&!"".equals(name)&&!"".equals(caliber)&&!"".equals(type)&&!"".equals(variety)&&!"".equals(detail)&&!"".equals(route)) {
			String sql = "update weapon set name = ?,caliber = ?,type = ?,variety = ?,detail = ?,route = ? where model = ? ";
			b = JDBCHelper.execute(sql,name,caliber,type,variety,detail,route,model);
		}
		return b;
	}
	
	/**
	 * 根据武器型号删除武器数据
	 * */
	public boolean deleteByModel(String model) {
		String sql = "delete from weapon where model = ?";
		boolean b = JDBCHelper.execute(sql, model);
		return b;
	}
}
