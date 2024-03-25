export module Line;

export import Point;
import <iostream>;

export class Line{
public:
  Line() {}
  Line(Point a, Point b) : m_a(a), m_b(b) {}
  void print();
  
private:
  Point m_a;
  Point m_b; 
};

void Line::print(){
  std::cout << "( ("
  	    << m_a.getx() << "," << m_a.gety() << ")"
	    << ", ("
  	    << m_b.getx() << "," << m_b.gety() << ")"
	    << " )" << std::endl;
}
