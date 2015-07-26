using System;

using System.Collections;

namespace IEnumeratorDemo
{
	class MainClass
	{
		public static void Main (string[] args)
		{
			Console.WriteLine ("Hello World!");

			var parkingLot = new ParkingLot ();

			Console.WriteLine ("In Order:");
			foreach (var i in parkingLot) {
				Console.WriteLine (i);
			}

			Console.WriteLine ("Reversed Order:");
			foreach (var i in parkingLot.ReverseLots()) {
				Console.WriteLine (i);
			}
		}
	}
		
	class ParkingLot: IEnumerable{
		public const int MAX = 10;
		private int[] lots = new int[MAX];

		public ParkingLot(){
			for (int i = 0; i < MAX; i++) {
				lots [i] = i;
			}
		}

		IEnumerator IEnumerable.GetEnumerator(){
			
//			return lots.GetEnumerator();
			return new CustomParkingLotEnumerator (lots);
		}

		public IEnumerable ReverseLots(){
			for (int i = lots.Length - 1; i >= 0; i--) {
				yield return lots [i];
			}
		}
	}

	class CustomParkingLotEnumerator: IEnumerator{
		private int[] lots;
		private int currentIndex = -1;
		public CustomParkingLotEnumerator(int[] lots){
			this.lots = lots;
		}

		public bool MoveNext(){
			if (lots == null || lots.Length == 0 || currentIndex >= lots.Length)
				return false;

			currentIndex = currentIndex == -1 ? 0 : currentIndex + 2; // Only get even indexes
			return true;
		}

		public object Current{
			get {
				if (currentIndex != -1 && currentIndex < lots.Length) {
					return lots [currentIndex];
				}

				return null;
			}
		}
			
		public void Reset(){
			currentIndex = -1;
		}
	}
}
