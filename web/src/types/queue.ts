export interface queue {
  items: item[];
  finished: item[];
}

export interface item {
  image: string;
  itemName: string;
  secondsLeft: number;
  timeStarted: number;
  timeToCraft: number;
  id: number;
}
