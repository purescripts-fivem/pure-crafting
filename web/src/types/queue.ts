export interface queue {
  items: item[];
  finished: item[];
  currentItem: number;
}

export interface item {
  image: string;
  itemName: string;
  secondsLeft: number;
  timeStarted: number;
}
