import java.util.Scanner;

class Shapes {

    double side, length, breadth, base, height, radius;

    Shapes(double side) {
        this.side = side;
    }

    Shapes(double length, double breadth) {
        this.length = length;
        this.breadth = breadth;
    }

    Shapes(double base, double height, boolean isTriangle) {
        this.base   = base;
        this.height = height;
    }

    Shapes(double radius, boolean isCircle) {
        this.radius = radius;
    }

    double area(double side) {
        return side * side;
    }

    double area(double length, double breadth) {
        return length * breadth;
    }

    double area(double base, double height, boolean isTriangle) {
        return 0.5 * base * height;
    }

    double area(double radius, boolean isCircle) {
        return Math.PI * radius * radius;
    }

    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int choice;

        do {
            System.out.println("\n===== SHAPE AREA CALCULATOR =====");
            System.out.println("1. Square");
            System.out.println("2. Rectangle");
            System.out.println("3. Triangle");
            System.out.println("4. Circle");
            System.out.println("0. Exit");
            System.out.print("Enter your choice: ");
            choice = sc.nextInt();

            switch (choice) {
                case 1:
                    System.out.print("Enter side of Square: ");
                    double s = sc.nextDouble();
                    Shapes sq = new Shapes(s);
                    System.out.println("Area of Square = " + sq.area(sq.side));
                    break;

                case 2:
                    System.out.print("Enter length of Rectangle: ");
                    double l = sc.nextDouble();
                    System.out.print("Enter breadth of Rectangle: ");
                    double b = sc.nextDouble();
                    Shapes rect = new Shapes(l, b);
                    System.out.println("Area of Rectangle = " + rect.area(rect.length, rect.breadth));
                    break;

                case 3:
                    System.out.print("Enter base of Triangle: ");
                    double bs = sc.nextDouble();
                    System.out.print("Enter height of Triangle: ");
                    double h = sc.nextDouble();
                    Shapes tri = new Shapes(bs, h, true);
                    System.out.println("Area of Triangle = " + tri.area(tri.base, tri.height, true));
                    break;

                case 4:
                    System.out.print("Enter radius of Circle: ");
                    double r = sc.nextDouble();
                    Shapes cir = new Shapes(r, true);
                    System.out.printf("Area of Circle = %.2f%n", cir.area(cir.radius, true));
                    break;

                case 0:
                    System.out.println("Exiting program...");
                    break;

                default:
                    System.out.println("Invalid choice! Please try again.");
            }

        } while (choice != 0);

        sc.close();
    }
}