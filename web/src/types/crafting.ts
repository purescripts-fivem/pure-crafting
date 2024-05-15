export interface craftingState {
  //   categories: any;
  // [key: string]: craftingItem[];

  items: craftingItem[];
  blueprints: craftingItem[];
  selectedItem: number;
  currentItem: craftingItem | null;
  amount: number;
}

export interface item {
  itemName: string;
  name: string;
  amount: number;
  myAmount: number;
  image: string;
}

export interface craftingItem {
  itemName: string; //
  name: string; //
  image: string; //
  category?: string; //
  id: number; //
  description: string; //
  craftingTime: number; //
  uses?: number;
  requiredItems: item[];
  type?: string;
}
