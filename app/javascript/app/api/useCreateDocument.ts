import { Document } from "@/models";
import { useMutation, useQueryClient } from "@tanstack/react-query";
import { postHeaders } from "./helpers";
export default function useCreateDocument(projectId?: number | string) {
    const queryClient = useQueryClient();
    const url = projectId ? `/projects/${projectId}/documents.json` : '/documents.json';
    return useMutation({
        mutationFn: async (newDocument: Document) => {
            const response = await fetch(url, {
                method: 'POST',
                headers: postHeaders(),
                body: JSON.stringify({ document: newDocument }),
            });

            if (!response.ok) {
                throw new Error('Failed to create document');
            }

            return response.json();
        },
        onSuccess: () => {
            queryClient.invalidateQueries({ queryKey: ['documents', 'projects', projectId] })
        },
    })
}