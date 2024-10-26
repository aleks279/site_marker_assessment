import { User } from "./User";

export type Document = {
    id?: number;
    name: string;
    created_at?: string;
    sharedWith?: User[];
}