import { useQuery } from '@tanstack/react-query';
import { getHeaders } from './helpers';
export default function useFetchUsers() {
    return useQuery({
        queryKey: ['users'],
        queryFn: () => fetch('/users.json', {
            headers: getHeaders,
        }).then((res) =>
            res.json(),
        ),
        retry: false,
    })
}