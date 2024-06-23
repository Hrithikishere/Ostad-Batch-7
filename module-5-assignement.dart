class Car {
  static int numberOfCars = 0;
  late String brand;
  late String model;
  late int year;
  late double milesDriven;

  Car(String brand, String model, int year, double milesDriven) {
    this.brand = brand;
    this.model = model;
    this.year = year;
    this.milesDriven = milesDriven;
    numberOfCars++;
  }

  void drive(double miles) {
    this.milesDriven += miles;
  }

  double getMilesDriven() {
    return this.milesDriven;
  }

  int getYear() {
    return this.year;
  }

  String getModel() {
    return this.model;
  }

  String getBrand() {
    return this.brand;
  }

  int getAge() {
    return DateTime.now().year - year;
  }
}

void main() {
  Car firstCar = new Car("Bugatti", "Chiron", 2020, 350.5);
  firstCar.drive(49.5);
  print("Car Name: ${firstCar.getBrand()}");
  print("Car Model: ${firstCar.getModel()}");
  print("Car Year: ${firstCar.getYear()}");
  print("Car Miles Driven: ${firstCar.getMilesDriven()}");
  print("Car Age: ${firstCar.getAge()}");
  print("");

  Car secondCar = new Car("Lamborghini", "Huracan", 2022, 640.5);
  secondCar.drive(59.5);
  print("Car Name: ${secondCar.getBrand()}");
  print("Car Model: ${secondCar.getModel()}");
  print("Car Year: ${secondCar.getYear()}");
  print("Car Miles Driven: ${secondCar.getMilesDriven()}");
  print("Car Age: ${secondCar.getAge()}");
  print("");

  Car thirdCar = new Car("Audi", "A8", 2021, 110.8);
  thirdCar.drive(89.2);
  print("Car Name: ${thirdCar.getBrand()}");
  print("Car Model: ${thirdCar.getModel()}");
  print("Car Year: ${thirdCar.getYear()}");
  print("Car Miles Driven: ${thirdCar.getMilesDriven()}");
  print("Car Age: ${thirdCar.getAge()}");
  print("");

  print("Total Car Object Created: ${Car.numberOfCars}");
}
