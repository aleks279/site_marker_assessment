import { useQuery } from '@tanstack/react-query';
export default function useFetchUser() {
    return useQuery({
        queryKey: ['me'],
        queryFn: () => fetch('/me', {
            headers: {
                'Content-type': 'application/json; charset=UTF-8',
                'X-Requested-With': 'XMLHttpRequest',
            },
        }).then((res) =>
            res.json(),
        ),
        retry: false,
    })
}