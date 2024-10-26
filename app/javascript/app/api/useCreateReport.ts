import { Report } from "@/models";
import { useMutation, useQueryClient } from "@tanstack/react-query";
import { postHeaders } from "./helpers";
export default function useCreateReport(projectId?: number | string) {
    const queryClient = useQueryClient();
    const url = projectId ? `/projects/${projectId}/reports.json` : '/reports.json';
    return useMutation({
        mutationFn: async (newReport: Report) => {
            const response = await fetch(url, {
                method: 'POST',
                headers: postHeaders(),
                body: JSON.stringify({ report: newReport }),
            });

            if (!response.ok) {
                throw new Error('Failed to create report');
            }

            return response.json();
        },
        onSuccess: () => {
            queryClient.invalidateQueries({ queryKey: ['reports', 'project', projectId] })
        },
    })
}