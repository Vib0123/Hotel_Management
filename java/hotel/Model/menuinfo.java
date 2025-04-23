package hotel.Model;

public class menuinfo {
    private int DishId;
    private double Dishprice;
    private String DishName;
    private String DishCategory;
    private String DishImage;  // New field for image path

    // Getters and Setters
    public String getDishImage() {
        return DishImage;
    }

    public int getDishId() {
		return DishId;
	}

	public void setDishId(int dishId) {
		DishId = dishId;
	}

	public double getDishprice() {
		return Dishprice;
	}

	public void setDishprice(double dishprice) {
		Dishprice = dishprice;
	}

	public String getDishName() {
		return DishName;
	}

	public void setDishName(String dishName) {
		DishName = dishName;
	}

	public String getDishCategory() {
		return DishCategory;
	}

	public void setDishCategory(String dishCategory) {
		DishCategory = dishCategory;
	}

	public void setDishImage(String dishImage) {
        DishImage = dishImage;
    }

    // Update Constructors
    public menuinfo(int dishId, double dishprice, String dishName, String dishCategory, String dishImage) {
        super();
        DishId = dishId;
        Dishprice = dishprice;
        DishName = dishName;
        DishCategory = dishCategory;
        DishImage = dishImage;
    }

    public menuinfo(double dishprice, String dishName, String dishCategory, String dishImage) {
        super();
        Dishprice = dishprice;
        DishName = dishName;
        DishCategory = dishCategory;
        DishImage = dishImage;
    }
    public menuinfo(int dishId, String dishName, String dishCategory, double dishprice, String dishImage) {
        this.DishId = dishId;
        this.DishName = dishName;
        this.DishCategory = dishCategory;
        this.Dishprice = dishprice;
        this.DishImage = dishImage;
    }

    public menuinfo() {
		// TODO Auto-generated constructor stub
	}

	// Override toString
    @Override
    public String toString() {
        return "menuinfo [DishId=" + DishId + ", Dishprice=" + Dishprice + ", DishName=" + DishName + ", DishCategory="
                + DishCategory + ", DishImage=" + DishImage + "]";
    }
    

	
}
