using System;
using System.Collections.Generic;

namespace IComparableDemo
{
	class MainClass
	{
		public static void Main (string[] args)
		{
			var b1 = new Ball (1, 10, 4);
			var b2 = new Ball (2, 9, 1);
			var b3 = new Ball (5, 6, 8);
			var b4 = new Ball (4, 7, 3);
			var b5 = new Ball (3, 8, 6);

			var balls = new List<Ball>{ b1, b2, b3, b4, b5 };

			Console.WriteLine ("Sort By Size using IComarable.");
			balls.Sort (); // Have to implement IComparable.

			foreach (var b in balls) {
				Console.WriteLine ("{0}-{1}-{2}", b.Size, b.Weight, b.Price);
			}

			Console.WriteLine ("Sort By Weight using Comparision delegate");
			balls.Sort ((a, b) => { // Comparision<T>
				if(a.Weight > b.Weight){
					return 1;
				}
				else if(a.Weight == b.Weight){
					return 0;
				}
				else{
					return -1;
				}
			});

			foreach (var b in balls) {
				Console.WriteLine ("{0}-{1}-{2}", b.Size, b.Weight, b.Price);
			}

			Console.WriteLine ("Sort By Price using IComparer.");
			balls.Sort (new PriceComparer());

			foreach (var b in balls) {
				Console.WriteLine ("{0}-{1}-{2}", b.Size, b.Weight, b.Price);
			}
		}

		public class PriceComparer: IComparer<Ball>{

			public int Compare(Ball a, Ball b){
				if (a.Price > b.Price) {
					return 1;
				} else if (a.Price == b.Price) {
					return 0;
				} else {
					return -1;
				}
			}
		}

		public class Ball: IComparable {
			public int Size { get; set;}

			public int Weight { get; set;}
			public int Price { get; set;}

			public Ball(int size, int weight, int price){
				Size = size;
				Weight = weight;
				Price = price;
			}

			int IComparable.CompareTo(object obj){

				Ball another = obj as Ball;

				if (another == null) {
					throw new Exception ("The parameter is not a ball!");
				} else {
					if (this.Size > another.Size) {
						return 1;
					} else if (this.Size == another.Size) {
						return 0;
					} else {
						return -1;
					}
				}
			}
		}
	}
}
