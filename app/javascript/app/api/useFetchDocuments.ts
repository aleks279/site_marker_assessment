import { useQuery } from '@tanstack/react-query';
import { getHeaders } from './helpers';
export default function useFetchDocuments(projectId?: string) {
    return useQuery({
        queryKey: ['documents', 'projects', projectId],
        queryFn: () => fetch(projectId ? `/projects/${projectId}/documents.json` : '/documents.json', {
            headers: getHeaders,
        }).then((res) =>
            res.json(),
        ),
        retry: false,
    })
}