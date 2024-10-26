import { User } from "./User";

export type Report = {
    id?: number;
    title: string;
    created_at?: string;
    sharedWith?: User[];
}