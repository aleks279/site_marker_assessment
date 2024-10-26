import { Report } from "@/models";
import { useMutation, useQueryClient } from "@tanstack/react-query";
import { postHeaders } from "./helpers";
export default function useUpdateReport(reportId?: number | string) {
    const queryClient = useQueryClient();
    return useMutation({
        mutationFn: async (newReport: Report) => {
            const response = await fetch(`/reports/${reportId}.json`, {
                method: 'PUT',
                headers: postHeaders(),
                body: JSON.stringify({ report: newReport }),
            });

            if (!response.ok) {
                throw new Error('Failed to update report');
            }

            return response.json();
        },
        onSuccess: () => {
            queryClient.invalidateQueries({ queryKey: ['reports', reportId] })
        },
    })
}