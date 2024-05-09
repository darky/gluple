import { List } from "../prelude.mjs";

export const isTuple = Array.isArray;

export const tupleSize = (arr) => arr.length;

export const element = (index, arr) => arr[index - 1];

export const tupleToList = (arr) => List.fromArray(arr);
