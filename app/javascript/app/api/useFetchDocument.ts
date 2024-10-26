import { useQuery } from '@tanstack/react-query';
import { getHeaders } from './helpers';
export default function useFetchDocument(id: string | number | undefined) {
    return useQuery({
        queryKey: ['documents', id],
        queryFn: () => fetch(`/documents/${id}.json`, {
            headers: getHeaders,
        }).then((res) =>
            res.json(),
        )
    })
}