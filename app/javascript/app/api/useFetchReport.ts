import { useQuery } from '@tanstack/react-query';
import { getHeaders } from './helpers';
export default function useFetchReport(id: string | number | undefined) {
    return useQuery({
        queryKey: ['reports', id],
        queryFn: () => fetch(`/reports/${id}.json`, {
            headers: getHeaders,
        }).then((res) =>
            res.json(),
        )
    })
}