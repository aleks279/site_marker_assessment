import { Document } from "@/models";
import { useMutation, useQueryClient } from "@tanstack/react-query";
import { postHeaders } from "./helpers";
export default function useUpdateDocument(documentId?: number | string) {
    const queryClient = useQueryClient();
    return useMutation({
        mutationFn: async (newReport: Document) => {
            const response = await fetch(`/documents/${documentId}.json`, {
                method: 'PUT',
                headers: postHeaders(),
                body: JSON.stringify({ document: newReport }),
            });

            if (!response.ok) {
                throw new Error('Failed to update document');
            }

            return response.json();
        },
        onSuccess: () => {
            queryClient.invalidateQueries({ queryKey: ['documents', documentId] })
        },
    })
}