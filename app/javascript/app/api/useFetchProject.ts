import { useQuery } from '@tanstack/react-query';
import { getHeaders } from './helpers';
export default function useFetchProject(id: string | number | undefined) {
    return useQuery({
        queryKey: ['projects', id],
        queryFn: () => fetch(`/projects/${id}.json`, {
            headers: getHeaders,
        }).then((res) =>
            res.json(),
        )
    })
}