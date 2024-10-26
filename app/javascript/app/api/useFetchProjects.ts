import { useQuery } from '@tanstack/react-query';
import { getHeaders } from './helpers';
export default function useFetchProjects() {
    return useQuery({
        queryKey: ['projects'],
        queryFn: () => fetch('/projects.json', {
            headers: getHeaders,
        }).then((res) =>
            res.json(),
        ),
        retry: false,
    })
}