import { useQuery } from '@tanstack/react-query';
import { getHeaders } from './helpers';
export default function useFetchReports(projectId?: string) {
    return useQuery({
        queryKey: ['reports', 'projects', projectId],
        queryFn: () => fetch(projectId ? `/projects/${projectId}/reports.json` : '/reports.json', {
            headers: getHeaders,
        }).then((res) =>
            res.json(),
        ),
        retry: false,
    })
}