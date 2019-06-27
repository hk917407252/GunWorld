package services;
import java.util.List;

import dao.WeaponDao;
import entity.Weapon;

/**
 * 对武器的服务类，提供对数据的各种操作方法
 * */
public class WeaponService {
	
	WeaponDao weaponDao = new WeaponDao();	//定义一个weaponDao对象，用于数据库操作
	
	/**
	 * 无参构造方法
	 */
	public WeaponService() {
		
	}
	
	/**
	 * 加载所有武器型号
	 * */
	public List<Weapon> loadAll(){		
		return weaponDao.loadAll();
	}
	
	/**
	 * 加载轻武器武器信息数目
	 * @return
	 */
	public int loadLightWeaponNumber(){
		return weaponDao.loadLightWeaponNumber();
	}
	
	/**
	 * 加载所有轻武器型号
	 * */
	public List<Weapon> loadAllLightWeapon(int page){		
		return weaponDao.loadAllLightWeapon(page);
	}
	
	/**
	 * 加载重武器武器信息数目
	 * @return
	 */
	public int loadHeavenWeaponNumber(){
		return weaponDao.loadHeavenWeaponNumber();
	}
	
	/**
	 * 加载所有重武器武器型号
	 * */
	public List<Weapon> loadAllHeavenWeapon(int page){		
		return weaponDao.loadAllHeavenWeapon(page);
	}
	
	/**
	 * 加载冷兵器武器信息数目
	 * @return
	 */
	public int loadColdWeaponNumber(){
		return weaponDao.loadColdWeaponNumber();
	}
	
	/**
	 * 加载所有冷兵器型号
	 * */
	public List<Weapon> loadAllColdWeapon(int page){		
		return weaponDao.loadAllColdWeapon(page);
	}
	
	/**
	 * 根据武器型号加载武器数据
	 * */
	public Weapon loadByModel(String model) {
		return weaponDao.loadByModel(model);
	}
	
	/**
	 * 根据输入的搜索内容模糊查询加载武器数据数目
	 * */
	public int loadByInputNumber(String input){
		return weaponDao.loadByInputNumber(input);
	}
	
	/**
	 * 根据输入的搜索内容模糊查询加载武器数据
	 * */
	public List<Weapon> loadByInput(String input,int page){
		return weaponDao.loadByInput(input,page);
	}
	
	/**
	 * 插入武器数据
	 * */
	public boolean insert(String model,String name,String caliber,String type,String variety,String detail,String route) {
		return weaponDao.insert(model, name, caliber, type, variety, detail, route);
	}
	
	/**
	 * 更新武器数据
	 * */
	public boolean update(String model,String name,String caliber,String type,String variety,String detail,String route) {
		return weaponDao.update(model, name, caliber, type, variety, detail, route);
	}
	
	/**
	 * 根据武器型号删除武器数据
	 * */
	public boolean deleteByModel(String model) {
		return weaponDao.deleteByModel(model);
	}
	
}
